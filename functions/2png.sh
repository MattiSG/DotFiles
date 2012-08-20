# Uses ImageMagick to export the given image file(s) to PNG

# Converts the given file to PNG.
# $1 = file
# $2 (optional) = density, defaults to 600
2png() {
	convert -background transparent -density ${2-600} "$1" "$1 - ${2-600}.png"
}

# Converts all files with the given extension to PNG.
# $1 = extension
# $2 (optional) = density, defaults to 600
all2png() {
	for f in *.$1
	do 2png "$f" $2
		echo "Converted $f"
	done
}
