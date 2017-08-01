cd `dirname "$1"`

TARGET_DIR="${2:-Reencoded}"

mkdir "$TARGET_DIR"

shared_options=""
shared_options="$shared_options -crf 28"  # ok quality
shared_options="$shared_options -preset veryslow"  # more compute power against smaller size
shared_options="$shared_options -codec:v libx265"  # use HEVC
shared_options="$shared_options -filter:video format=yuv420p"  # ensure QuickTime can read resulting file
shared_options="$shared_options -filter:video scale=1280:720"  # decrease size of full HD streams
shared_options="$shared_options -codec:audio aac -ac 1 -b:a 80k"  # decrease audio quality to something acceptable for voice
shared_options="$shared_options -movflags +faststart"  # ensure internet streaming is smooth

reencode() {
	filename=`basename $1 '.mp4'`

	if [[ -e "$filename.jpg" ]]
	then local file_specific_options="-attach $filename.jpg"  # add cover artwork
	fi

	ffmpeg -i "$1" $shared_options $file_specific_options "$TARGET_DIR/$filename.mp4"
	touch -r "$1" "$TARGET_DIR/$filename.mp4"  # copy mtime and ctime
}

if [[ $1 ]]
then reencode "$1"
else
	for file in *.mp4 *.mov
	do reencode "$file"
	done
fi

