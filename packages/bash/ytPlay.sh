#!/bin/bash
count=`youtube-dl "$1" --flat-playlist |grep  "Downloading video" |wc -l`
for idx in `seq 1 $count`
do
	rm fifo.mp3
	mkfifo fifo.mp3
	youtube-dl "$1" -x --audio-format mp3 -o fifo.mp3 --playlist-items $idx 2> /dev/null >/dev/null &
	mpv fifo.mp3 --no-resume-playback --force-seekable=yes
	rm $file_name
done

