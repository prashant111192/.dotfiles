#!/usr/bin/env bash
# Author: Kn
# https://github.com/CondensedMilk7/i3blocks/blob/master/scripts/i3-focusedwindow

while :
do
  ID=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')
  if [[ $1 ]] 
  then
    TITLE=$(xprop -id $ID -len $1 | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2)
    echo "$TITLE"
  else
    TITLE=$(xprop -id $ID | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2)
    echo "$TITLE"
  fi
done

