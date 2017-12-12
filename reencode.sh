cd `dirname "$1"`

TARGET_DIR_PREFIX="${2:-Reencoded}"
encoder=libx265  # libx265 = HEVC, little support but much smaller filesize; libx264 = H.264, very wide support
quality=20  # ok quality = 28 for HEVC, 23 for H264; great quality = 22 for HEVC, 20 for H264
scale="1280:720"  # decrease size of full HD streams; leave empty for no downscaling
audio_bitrate="80k"  # decrease audio quality to something acceptable for voice; set to 180k for precise music; leave empty to remove audio

target_dir="$TARGET_DIR_PREFIX-$encoder-$quality"

mkdir "$target_dir"

shared_options=""
shared_options="$shared_options -crf $quality"
shared_options="$shared_options -preset veryslow"  # more compute power against smaller size
shared_options="$shared_options -codec:v $encoder"
shared_options="$shared_options -filter:video format=yuv420p"  # ensure QuickTime can read resulting file
if [[ $scale ]]
then shared_options="$shared_options -filter:video scale=$scale"
fi
if [[ $audio_bitrate ]]
then shared_options="$shared_options -codec:audio aac -b:a $audio_bitrate"
else shared_options="$shared_options -an"
fi
shared_options="$shared_options -movflags +faststart"  # ensure internet streaming is smooth

reencode() {
	filename=`echo "$1" | rev | cut -d '.' -f 2- | rev`  # remove extension

	if [[ -e "$filename.jpg" ]]
	then local file_specific_options="-attach $filename.jpg"  # add cover artwork
	fi

	ffmpeg -i "$1" $shared_options $file_specific_options "$target_dir/$filename.$encoder.mp4"
	touch -r "$1" "$target_dir/$filename.$encoder.mp4"  # copy mtime and ctime
}

if [[ $1 ]]
then reencode "$1"
else
	for file in *.mp4 *.mov
	do reencode "$file"
	done
fi

