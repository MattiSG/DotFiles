cd $(dirname "$BASH_SOURCE")
source="$(pwd)"

git submodule sync
git submodule update --init --recursive

read -p 'Has this machine already been set up? [Y/n]' -n 1 machineAlreadySetUp

if [[ $machineAlreadySetUp != 'n' ]]
then
	echo 'Nothing to do for the machine'
else
	echo "Opening AppStore for manual install"
	open -a "App Store"

	echo "Waiting for Xcode to be installed…"

	while ! which -s xcode-select
	do
		sleep 1
		echo -n '.'
	done

	echo "Xcode is installed"
	echo "Installing CLI tools…"

	xcode-select --install	# install CLI tools; credit: MoOx

	echo "CLI tools installed"

	for script in $(ls $source/machine)
	do
		echo "Executing $script for the whole machine"
		$source/machine/$script || exit 1
	done
fi

for script in $(ls $source/session)
do
	echo "Executing $script for the current session"
	$source/session/$script || exit 1
done

echo 'Done'
