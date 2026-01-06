sudo docker run --rm -it \
  --device=/dev/dri:/dev/dri \
  -v $(pwd):/config  \
  -v /volume2/video_conversion/output:/output \
  -v /volume1/incoming/media/movie/temp:/input \
  linuxserver/ffmpeg  \
  -i "<VIDEO_FILE>" \
  -i "<SRT_FUILE>"  \
  -c copy -c:s mov_text -metadata:s:v:0 language=eng -metadata:s:s:0 language=eng \
 "<OUTPUT_FILE>"
