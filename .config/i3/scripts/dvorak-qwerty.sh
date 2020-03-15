#!/bin/bash
if [ $(setxkbmap -query | grep variant | tail -c -7) = "dvorak" ]
then
	setxkbmap us
else
	#setxkbmap -variant dvorak -layout us
	#setxkbmap -variant colemak -layout us
	setxkbmap gr
	#setxkbmap ru
fi

