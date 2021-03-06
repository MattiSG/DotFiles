source $(dirname "$BASH_SOURCE")/../lib/MSGShellUtils/ui.sh

user() {
	echo -n $boldon
	if [[ $USER == "matti" ]]
	then echo -n $greenf"∵"
	else echo -n "$redf$USER"
	fi
	echo -n "$reset"
}

host() {
	echo -n $boldon
	if [[ $HOSTNAME == "MS-Laptop.local" ]]
	then echo -n $greenf"∴"
	else echo -n " $yellowf$HOSTNAME"
	fi
	echo -n " $reset"
}

directory() {
	local pwd="$(pwd)"

	echo -n $purplef
	if [[ $pwd == $HOME ]]
	then echo -n $boldon'~'
	elif [[ $pwd == '/' ]]
	then echo -n $boldon'/'
	else
		echo -n $(basename "$(dirname "$pwd")")/$boldon$(basename "$pwd")
	fi
	echo -n $reset
}

timestamp() {
	echo -n "⦑ $(date '+%H:%M:%S') "
}

# Exit code of previous command.
# Credit: <https://github.com/cowboy/dotfiles/blob/master/source/50_prompt.sh>
exit_code() {	# [exit code]
	if [[ $1 != 0 ]]
	then echo " $redb $1 $reset"
	fi
}

parse_git_dirty() {
	[[ $(git status 2> /dev/null | wc -l) != "       2" ]] && echo '⊛'
}

gitinfo() {
	result=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/")
	if [[ -n $result ]]
	then echo -n " $cyanf[$result]$boldon$(parse_git_dirty)$reset"
	fi
}

# Credit: <http://frantic.im/notify-on-completion>
notify_if_not_frontmost() {
	local exit_code=$1
	local previous_command=$(history | tail -1 | cut -d ' ' -f 5-)
	osascript "$(dirname "$BASH_SOURCE")/../lib/notify-if-not-terminal.scpt" "$previous_command" "$exit_code" || "$(dirname "$BASH_SOURCE")/../session/enable-terminal-notifications.sh"
}

prompt_command() {
	local exit_code=$?
	(notify_if_not_frontmost $exit_code &) > /dev/null

	PS1="$(user)$(host)$(directory)$(gitinfo) $(timestamp)$(exit_code $exit_code)\n› "
}

PROMPT_COMMAND="prompt_command"
