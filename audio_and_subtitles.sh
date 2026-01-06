#!/bin/bash

# Ensure input and output files are specified
if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <input_file> <output_file>"
  exit 1
fi

# Input and output file parameters
INPUT_FILE=$1
OUTPUT_FILE=$2

# Docker run command
docker run --rm -it \
  --device=/dev/dri:/dev/dri \
  -v "$(pwd)":/config \
  -v /srv/remotemount/nas_video_conversion/output:/output \
  linuxserver/ffmpeg \
  # -ss 00:04:30 -to 00:06:30 \
  -i "/output/$INPUT_FILE" \
  -map 0 -c:v copy -c:a aac -c:s srt "/output/$OUTPUT_FILE"
