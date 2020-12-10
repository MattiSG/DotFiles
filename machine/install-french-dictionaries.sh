TARGET_DIR=/Library/Dictionaries

sudo -v

mkdir -p "$TARGET_DIR"

install_dictionary() {
	sudo curl -# "https://dl.mattischneider.fr/dictionaries/$1.dictionary.zip" -o "$TARGET_DIR/$1.dictionary.zip"
	sudo unzip -o "$TARGET_DIR/$1.dictionary.zip" -x '__MACOSX/*' -d "$TARGET_DIR/"
	sudo rm "$TARGET_DIR/$1.dictionary.zip"
}

install_dictionary xmlittre
install_dictionary academie-francaise

sudo chown -R root:wheel "$TARGET_DIR"
