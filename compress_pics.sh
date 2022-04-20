SOURCE="$HOME/Pictures/Photos.photoslibrary/originals"
DAYS_PAST=60
MEMORY="$HOME/.mattisg_pics_compressor"

mkdir -p "$MEMORY"

pics_list_name=$(date "+%Y-%m-%dT%H-%M-%S").txt

find "$SOURCE" -type f -ctime -$DAYS_PAST | egrep --ignore-case '(jpeg|png|jpg)$' > "$MEMORY/$pics_list_name"

echo -n "Number of pictures added in the last $DAYS_PAST days:"
cat "$MEMORY/$pics_list_name" | wc -l

while [ -n `head -1 "$MEMORY/$pics_list_name"` ]
do
	open -g -a ImageOptim `head -1 "$MEMORY/$pics_list_name"`  # -g: open in the background
	sed -i '' 1d "$MEMORY/$pics_list_name"  # a zero-length extension is required under macOS
	sleep 1
	echo -n .
done

# echo -n "Number of videos added in the last $DAYS_PAST days:"
# find "$SOURCE" -type f -ctime -$DAYS_PAST | egrep --ignore-case '(mov|mp4)$' | wc -l
