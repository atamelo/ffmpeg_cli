sudo docker run --rm -it \
  --device=/dev/dri:/dev/dri \
  -v $(pwd):/config \
  -v /volume2/video_conversion/output:/output \
  -v /volume1/incoming/media/movie/temp:/input \
  linuxserver/ffmpeg \
  -i "/input/---" \
  -map 0 -c copy -c:a libfdk_aac -profile:a aac_low -vbr 5 -ac 6 -cutoff 20000 \
  "---"
