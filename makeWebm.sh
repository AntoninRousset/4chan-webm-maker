#!/bin/sh

# 4chan webm maker

START_TIME="0:00:00"
DURATION="120" # Max 120s
MAX_SIZE="3M" # 3072KB
COMPRESSION="10" # [4, 63]
AUDIO_QUALITY="3"

ffmpeg -i "$1" -ss "$START_TIME" -t "$DURATION" -vcodec libvpx -crf "$COMPRESSION" -acodec libvorbis -aq "$AUDIO_QUALITY" -fs "$MAX_SIZE" "$2" -pass1
ffmpeg -i "$1" -ss "$START_TIME" -t "$DURATION" -vcodec libvpx -crf "$COMPRESSION" -acodec libvorbis -aq "$AUDIO_QUALITY" -fs "$MAX_SIZE" "$2" -pass2


# TODO
# OPENCL/MULTITHREADING
# MAX_DIMENSIONS of 2048x2048
# AUTOMATICALLY SET COMPRESSION
# -to
# TOGGLE AUDIO WITH -an (/b/)
# CHECK -threads
# CHECK allowed for 4chan
# youtube-dl
# automatically $2 from $1 if not defined
# bitrate
