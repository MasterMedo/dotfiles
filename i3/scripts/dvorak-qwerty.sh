#!/bin/bash
if [ $(setxkbmap -query | grep variant | tail -c -7) = "dvorak" ]
then
	setxkbmap us
else
	setxkbmap -variant dvorak -layout us
fi

