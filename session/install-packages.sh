DEST_DIR="~/Library/Application Support/Sublime Text 2/Installed Packages"

echo 'Installing Sublime Text Package Control…'
mkdir -p "$DEST_DIR"
curl -# https://sublime.wbond.net/Package%20Control.sublime-package -o "$DEST_DIR/Package Control.sublime-package"