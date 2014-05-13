#!/bin/bash

# modo de uso
# convertir [nombre archivo sin extencion] [frame] [duracion]

nombre_video=$1'.ogv'
echo $nombre_video

ffmpeg -i $nombre_video -an  sa.mp4

nombre_audio=$1'-listo.mp3'
echo $nombre_audio
ffmpeg -i $nombre_audio -i sa.mp4 ca.mp4

melt ca.mp4 -mix $2 -mixer luma colour:white out=$3 -mix $3 -mixer luma -consumer avformat:salida.mp4

video_salida=$1'.mp4'
echo $video_salida

ffmpeg -i salida.mp4  -vf "movie=logo-azul.png [watermark]; [in][watermark] overlay=(main_w-overlay_w-10):(main_h-overlay_h-10) [out]"  -qscale 0  $video_salida

rm sa.mp4
rm ca.mp4
rm salida.mp4
