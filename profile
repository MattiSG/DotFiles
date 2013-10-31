BASEDIR=$(dirname "$BASH_SOURCE")

source "$BASEDIR/paths.sh"
source "$BASEDIR/aliases.sh"
source "$BASEDIR/prompt.sh"
for f in $(ls -1 "$BASEDIR/functions")
do source "$BASEDIR/functions/$f"
done

# Open path to Finder frontmost window
finder

export EDITOR='/Applications/Sublime Text 2.app/Contents/MacOS/Sublime Text 2'

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Init rbenv
eval "$(rbenv init -)"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Prevent commands beginning with a space to be added to the history
# Credit: http://stackoverflow.com/questions/640403
HISTCONTROL='ignoredups:ignorespace'

echo "								Woudzigouga Bougou D'Négué !"
