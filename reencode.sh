#!/bin/bash

if [[ $1 == '--dry-run' ]]
then
	dry_run=true
	shift
fi

if [[ $# == 0 ]]
then source_files="*.[mM][pPoO4][4gGvV]"
else source_files="$@"
fi


TARGET_DIR_PREFIX="Reencoded"

encoder=libx265  # libx265 = HEVC, little support but much smaller filesize; libx264 = H.264, very wide support
quality=28  # ok quality = 28 for HEVC, 23 for H264; great quality = 22 for HEVC, 20 for H264
scale=""  # decrease size of full HD streams: set to 1280:720; leave empty for no downscaling
audio_bitrate="80k"  # decrease audio quality to something acceptable for voice; set to 180k for precise music; leave empty to remove audio
frame_rate=""  # set to 12 for video call archives

target_dir="$TARGET_DIR_PREFIX-$encoder-$quality"

shared_options=""
shared_options="$shared_options -crf $quality"
shared_options="$shared_options -preset veryslow"  # more compute power against smaller size
shared_options="$shared_options -codec:v $encoder"
shared_options="$shared_options -filter:v format=yuv420p"  # ensure QuickTime can read resulting file


if [[ $encoder == 'libx265' ]]
then shared_options="$shared_options -tag:v hvc1"  # ensure QuickTime can read HEVC file, see https://stackoverflow.com/a/46540577/594053
fi
if [[ $scale ]]
then shared_options="$shared_options -filter:v scale=$scale"
fi
if [[ $frame_rate ]]
then shared_options="$shared_options -r $frame_rate"
fi
if [[ $audio_bitrate ]]
then shared_options="$shared_options -codec:a aac -b:a $audio_bitrate"
else shared_options="$shared_options -an"
fi
shared_options="$shared_options -movflags +faststart"  # ensure internet streaming is smooth

reencode_command() {
	filename=`echo "$1" | rev | cut -d '.' -f 2- | rev`  # remove extension

	if [[ -e "$filename.jpg" ]]
	then local file_specific_options="-attach '$filename.jpg'"  # add cover artwork
	fi

	echo ffmpeg -i "'$1'" $shared_options $file_specific_options "'$target_dir/$filename.$encoder.mp4'"
}


if ! [[ $dry_run ]]
then mkdir "$target_dir"
fi

for file in $source_files
do
	command=`reencode_command "$file"`

	if [[ $dry_run ]]
	then echo $command
	else
		bash -c "$command"
		touch -r "$1" "$target_dir/$filename.$encoder.mp4"  # copy mtime and ctime
	fi
done

