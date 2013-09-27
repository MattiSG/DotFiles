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

./brew-install.sh
