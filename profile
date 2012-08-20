source "paths.sh"
source "aliases.sh"
source "prompt.sh"
for f in $(ls -1 functions)
do source "functions/$f"
done

# Open path to Finder frontmost window
finder

export EDITOR=/Applications/Smultron.app/Contents/MacOS/Smultron

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

echo "								Woudzigouga Bougou D'Négué !"
