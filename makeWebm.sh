#!/bin/sh

# 4chan webm maker

START_TIME="0:00:00"
DURATION="60" # Max 120s
#MAX_SIZE="3145728" # 3MB 
MAX_SIZE="4194304" # 4MB
RESOLUTION="720" #720p

in="$1"
out="$2"
shift 2

a_bitrate="96000"
v_bitrate="$((8*$MAX_SIZE/$DURATION-$a_bitrate))"

ffmpeg -i "$in" -ss "$START_TIME" -t "$DURATION" -map_metadata -1 -c:v libvpx -b:v "${v_bitrate}" -vf scale=-1:"$RESOLUTION" -c:a libvorbis -b:a "$a_bitrate" -quality best "$out" -pass 1 $@ &&\
ffmpeg -i "$in" -ss "$START_TIME" -t "$DURATION" -map_metadata -1 -c:v libvpx -b:v "${v_bitrate}" -vf scale=-1:"$RESOLUTION" -c:a libvorbis -b:a "$a_bitrate" -quality best "$out" -pass 2 $@ -y


# TODO
# OPENCL/MULTITHREADING
# MAX_DIMENSIONS of 2048x2048
# -to
# TOGGLE AUDIO WITH -an (/b/)
# CHECK -threads
# CHECK allowed for 4chan
# youtube-dl
# automatically $2 from $1 if not defined
