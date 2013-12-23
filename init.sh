cd $(dirname "$BASH_SOURCE")
source="$(pwd)"

git submodule sync
git submodule update --init --recursive

for file in $(find dots -type f)
do
	dotfile=$(echo $file | cut -d '/' -f 2-)	# remove "dots/" directory
	target="$HOME/.$dotfile"

	if [[ `readlink "$target"` == "$dotfile" ]]
	then echo "$target already linked"
	else ln -s -v "$source/dots/$dotfile" "$target"
	fi
done

if [[ -f ~/.profile ]]
then echo ".profile already exists. Refusing to overwrite it."
else
	echo "source $source/profile" > ~/.profile
	echo "Linked .profile"
fi

read -p 'Has this machine already been set up? [Y/n]' -n 1 machineAlreadySetUp

if [[ $machineAlreadySetUp != 'n' ]]
then
	echo 'Nothing to do for the machine'
else
	xcode-select --install	# install CLI tools; credit: MoOx

	for script in $(ls $source/machine)
	do
		echo "Executing $script for the whole machine"
		bash $source/machine/$script
	done
fi

for script in $(ls $source/session)
do
	echo "Executing $script for the current session"
	bash $source/session/$script
done

echo 'Done'
