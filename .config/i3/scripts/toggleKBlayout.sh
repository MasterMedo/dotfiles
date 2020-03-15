#!/bin/bash
if [ $(setxkbmap -query | grep layout | tail -c -3) = "us" ]
then
  setxkbmap hr
else
  setxkbmap us
fi
