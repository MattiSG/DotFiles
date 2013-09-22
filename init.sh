cd $(dirname "$BASH_SOURCE")

git submodule sync
git submodule update --init --recursive

source=$(pwd)

for file in $(ls "$source/dots")
do ln -s "$source/$file" ~/.$file
done

echo "source $source/profile" > ~/.profile

./brew-install.sh
