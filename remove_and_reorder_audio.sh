sudo docker run --rm -it \
  --device=/dev/dri:/dev/dri  \
  -v "$(pwd)":/config   -v /volume2/video_conversion/output:/output  \
  -v /volume1/incoming/media/movie/temp:/input \
  linuxserver/ffmpeg  \
  -i "/input/$INPUT" \
  -map 0:v   -map 0:a:7   -map 0:a:5   -map 0:s   -c:v copy -c:a aac -c:s copy \
  -disposition:a:0 default   -disposition:a:1 none  \
 "/output/$OUTPUT"
