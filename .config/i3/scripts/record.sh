#!/bin/bash

# Luke Smith's script for screen recording
# dependencies: xorg-xdpyinfo
if [[ -f ~/output.mkv ]]
then
				n=1
				while [[ -f $HOME/output_$n.mkv ]]
				do
								n=$((n+1))
				done
				filename="$HOME/output_$n.mkv"
else
				filename="$HOME/output.mkv"
fi

ffmpeg -y \
				-f x11grab \
				-s $(xdpyinfo | grep dimensions | awk '{print $2;}')\
				-i :0.0 \
				-f alsa -i default \
				-c:v libx264 -r 5 -c:a flac $filename
